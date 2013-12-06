class VmProductView extends JView
  constructor: (options = {}, data) ->
    super options, data

  pistachio: ->
    """
    <h3>{{ #(title) }}</h3>
    <div>
      {span{ @utils.formatMoney #(feeAmount) / 100 }}
      <span class="per-month">/ mo</span>
    </div>
    """