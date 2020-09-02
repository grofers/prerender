// #!/usr/bin/env node
var prerender = require('./lib');

var server = prerender({
    chromeFlags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222', '--remote-debugging-address=0.0.0.0', '--hide-scrollbars', '--disable-dev-shm-usage'],
    forwardHeaders: true,
    waitUntil: 'load'
});

server.use(prerender.sendPrerenderHeader());
server.use(prerender.blockResources());
server.use(prerender.removeScriptTags());
server.use(prerender.httpHeaders());

server.start();

