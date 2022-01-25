// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.css"

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let Hooks = {};
Hooks.Chart = {
    tickers() { return JSON.parse(this.el.dataset.tickers) },
    mounted() {
        let ctx = this.el.getContext('2d');
        let chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: this.tickers().bitbay.map(ticker => ticker.x),
                datasets: [{
                    label: 'Bitbay',
                    borderColor: 'rgb(255, 99, 132)',
                    data: this.tickers().bitbay.map(ticker => ticker.y)
                },{
                    label: 'Exchange',
                    borderColor: 'rgb(155, 49, 32)',
                    data: this.tickers().exchange.map(ticker => ticker.y)
                },{
                    label: 'Bittrex',
                    borderColor: 'rgb(55, 149, 32)',
                    data: this.tickers().bittrex.map(ticker => ticker.y)
                },{
                    label: 'Cex',
                    borderColor: 'rgb(99, 11, 77)',
                    data: this.tickers().cex.map(ticker => ticker.y)
                }]
            },
            options: {}
        });

        this.handleEvent("tickers", (data) => {
            chart.data.datasets[0].data = data.tickers.bitbay.map(ticker => ticker.y);
            chart.data.datasets[1].data = data.tickers.exchange.map(ticker => ticker.y);
            chart.data.datasets[2].data = data.tickers.bittrex.map(ticker => ticker.y);
            chart.data.datasets[3].data = data.tickers.cex.map(ticker => ticker.y);
            chart.data.labels = data.tickers.bitbay.map(ticker => ticker.x);
            chart.update();
        });
    }
};

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: { _csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
