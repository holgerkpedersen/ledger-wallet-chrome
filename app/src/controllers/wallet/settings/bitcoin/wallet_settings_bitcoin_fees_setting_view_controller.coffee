class @WalletSettingsBitcoinFeesSettingViewController extends WalletSettingsSettingViewController

  renderSelector: "#fees_table_container"
  view:
    feesSelect: "#fees_select"

  onAfterRender: ->
    super
    for id in _.sortBy(_.keys(ledger.preferences.defaults.Bitcoin.fees), (id) -> ledger.preferences.defaults.Bitcoin.fees[id].value)
      fee = ledger.preferences.defaults.Bitcoin.fees[id]
      text = _.str.sprintf(t(fee.localization), ledger.formatters.formatValue(fee.value))
      node = $("<option></option>").text(text).attr('value', fee.value)
      @view.feesSelect.append node