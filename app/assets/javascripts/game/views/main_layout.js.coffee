class GC.MainLayout extends Backbone.Marionette.ItemView
  template: "game/templates/demo_template"
  className: "game-console"

  serializeData: ->
    stam: "asdf"

#  regions:
#    status_region: ".status_indicator"
#
#  onShow: ->
#    if @model.get('verified') == false
#      @$('.device-data.name').addClass('unverified_device')
#    @status = new SC.Management.Admin.Views.DeviceStatus(model: @model)
#    @status_region.show(@status)
#
#  serializeData: ->
#    device_name: @model.get("description") or "Unknown device"
#    show_device_statuses: sc.current_organization.show_device_statuses
