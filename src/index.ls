module.exports =
  pkg:
    name: 'empty', version: '0.0.1'
    dependencies: [
      {url: "/assets/lib/@loadingio/debounce.js/main/debounce.min.js"}
      {url: "/assets/lib/wrap-svg-text/main/index.min.js", async: false}
      {url: "/assets/lib/@plotdb/layout/main/index.min.js", async: false}
      {url: "/assets/lib/@plotdb/layout/main/index.min.css", type: \css}
      {url: "/assets/lib/ldcolor/main/ldcolor.min.js", async: false}
      {url: "/assets/lib/@plotdb/chart/main/chart.js", async: false}
      {url: "/assets/lib/@plotdb/chart/main/chart.min.css", type: \css}
      {url: "/assets/lib/@plotdb/chart/main/utils/legend.js", async: false}
      {url: "/assets/lib/@plotdb/chart/main/utils/legend.css", type: \css}
      {url: "/assets/lib/@plotdb/chart/main/utils/tint.js", async: false}
      {url: "/assets/lib/@plotdb/chart/main/utils/data.js", async: false}
    ]

  init: ({root, context, pubsub, data}) ->
    {chart} = context
    pubsub.on \init, (opt = {}) ~>
      opt = {root, delay-render: true} <<< opt
      @chart = c = new chart(opt <<< {prepare-svg: false, layout: false} <<< data)
      c.init!then -> c
    @

  interface: -> @chart

  mod: (root) -> {config: {}, dimension: {}, init: (->), resize: (->), render: (->)}
