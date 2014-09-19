updateTable = (inst, cur) ->
  # do not render pie if no data
  return  if cur.count() is 0
  cur.forEach (sale) ->
    inst.$("#" + sale._id + "_region").text sale.region
    inst.$("#" + sale._id + "_total").text sale.total

plotit = (inst, cur) ->
  # do not render pie if no data
  return  if cur.count() is 0
  data = []
  cur.forEach (sale) ->
    data.push [
      sale.region
      sale.total
    ]

  inst.$.jqplot "chart", [data],
    seriesDefaults:

      # Make this a pie chart.
      renderer: $.jqplot.PieRenderer
      rendererOptions:

        # Put data labels on the pie slices.
        # By default, labels show the percentage of the slice.
        showDataLabels: true

    legend:
      show: true
      location: "e"

updateDB = (value, settings) ->
  console.log this
  console.log @getAttribute("sid")
  console.log value
  console.log settings
  val = value
  sid = @getAttribute("sid")
  Meteor.setTimeout (->
    console.log "callback val is " + val
    Sales2013.update sid,
      $set:
        total: parseInt(val)

  ), 1000
  value
Sales2013 = new Meteor.Collection("regional_sales")
Meteor.subscribe "global_sales"
Template.salesdata.dataset = ->
  Sales2013.find {}

Template.piechart.rendered = ->
  Deps.autorun ->
    plotit this, Sales2013.find({})
    updateTable this, Sales2013.find({})

Template.datapoint.rendered = ->
  @$(".editable").editable updateDB,
    type: "text"
    style: "inherit"
    width: 100
    submit: "OK"
