Sales2013 = new Meteor.Collection("regional_sales")
if Meteor.isClient
  updateTable = (inst, cur) ->
    # do not render pie if no data
    return unless cur.count()
    cur.forEach (sale) ->
      inst.$("#" + sale._id + "_region").text sale.region
      inst.$("#" + sale._id + "_total").text sale.total

  plotit = (inst, cur) ->
    # do not render pie if no data
    return unless cur.count()
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

  Template.salesdata.dataset = ->
    Sales2013.find {}

  Template.datapoint.selected = ->
    (if Session.equals("selected_datapoint", @_id) then "selected" else "")

  Template.datapoint.events = click: ->
    Session.set "selected_datapoint", @_id

  Template.piechart.rendered = ->
    Deps.autorun ->
      plotit this, Sales2013.find({})
      updateTable this, Sales2013.find({})

  Template.datapoint.rendered = ->
    @$(".editable").editable ((value, settings) ->
      Sales2013.update Session.get("selected_datapoint"),
        $set:
          total: parseInt(value)

      value
    ),
      type: "text"
      style: "inherit"
      width: 100
      submit: "OK"

if Meteor.isServer
  Meteor.startup ->
    Sales2013.remove {}
    Sales2013.insert
      region: "US East"
      total: 2032333

    Sales2013.insert
      region: "US Central"
      total: 150332

    Sales2013.insert
      region: "US West"
      total: 1202412

    Sales2013.insert
      region: "Asia Pacific"
      total: 701223
