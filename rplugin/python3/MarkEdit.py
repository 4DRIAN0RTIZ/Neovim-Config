import neovim
import markdown
import http.server
import socketserver
import threading
import subprocess
import websockets
import asyncio

HTTP_PORT = 1089
WS_PORT = 1090
handler = http.server.SimpleHTTPRequestHandler
stylesheet = """
    <style>
    body {
        line-height: 1.6;
        padding: 20px;
        max-width: 800px;
        margin: auto;
        background-color: #f4f4f4;
    }
    #markdown-content {
        background: #fff;
        border: 1px solid #ddd;
        padding: 20px;
    }
    h1, h2, h3, h4, h5, h6 {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }
    code {
        background: #eee;
        padding: 2px 5px;
        border-radius: 5px;
    }
    pre {
        background: #333;
        color: #fff;
        padding: 10px;
        border-radius: 5px;
        overflow: auto;
    }
    a {
        color: #0077b6;
        text-decoration: none;
    }
    </style>
"""

@neovim.plugin
class MarkdownPreviewer(object):
    def __init__(self, nvim):
        self.nvim = nvim
        self.websockets_list = []
        self.server_thread = threading.Thread(target=self.run_server)
        self.server_thread.daemon = True
        self.server_thread.start()
        self.browser_opened = False

    def run_server(self):
        # La corutina asyncio para iniciar ambos servidores.
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
        loop.run_until_complete(self.start_servers())
        loop.run_forever()

    async def start_servers(self):
        # Iniciar el servidor HTTP
        http_server = socketserver.TCPServer(("", HTTP_PORT), handler)
        httpd_thread = threading.Thread(target=http_server.serve_forever)
        httpd_thread.daemon = True
        httpd_thread.start()
        # Iniciar el servidor WebSocket
        await websockets.serve(self.websocket_handler, "localhost", WS_PORT)

    async def websocket_handler(self, websocket, path):
        # Agregar el nuevo WebSocket a la lista.
        self.websockets_list.append(websocket)
        try:
            await websocket.wait_closed()
        finally:
            # Remover el WebSocket de la lista.
            self.websockets_list.remove(websocket)

    @neovim.autocmd('TextChanged,TextChangedI', pattern='*.md', sync=False)
    def on_markdown_change(self):
        # Llama a la función de actualización de manera asíncrona.
        self.nvim.async_call(self.update_preview)


    def construct_full_html(self, html_content):
        web_socket_script = """
        <script>
        var ws = new WebSocket("ws://localhost:1090/");
        ws.onmessage = function(event) {
            var content = event.data;
            document.getElementById('markdown-content').innerHTML = content;
          };
        </script>
        """

        # HTML completo con el contenido de Markdown y el script de WebSocket
        full_html = f"""
        <!DOCTYPE html>
        <html>
            <head>
            <meta charset="utf-8">
            <title>Markdown Preview</title>
            <!-- Aquí puedes agregar más metadatos o enlaces a CSS -->
            {stylesheet}
            </head>
        <body>
            <div id="markdown-content">{html_content}</div>
            {web_socket_script}
        </body>
        </html>
        """
        return full_html


    def update_preview(self):
        buffer_content = "\n".join(self.nvim.current.buffer[:])
        html_content = markdown.markdown(buffer_content)
        full_html = self.construct_full_html(html_content)
        # Escribir el HTML completo en el archivo.
        with open('index.html', 'w') as file:
            file.write(full_html)
        # Enviar el contenido de Markdown a todos los WebSockets.
        html_content = markdown.markdown("\n".join(self.nvim.current.buffer[:]))
        for websocket in self.websockets_list:
            asyncio.run_coroutine_threadsafe(websocket.send(html_content), asyncio.get_event_loop())


    @neovim.command('MDGDPreview', nargs='0', sync=False)
    def command_preview(self, args):
        if not self.browser_opened:
            subprocess.Popen(['xdg-open', f'http://localhost:{HTTP_PORT}/index.html'])
            self.browser_opened = True
        self.on_markdown_change()
