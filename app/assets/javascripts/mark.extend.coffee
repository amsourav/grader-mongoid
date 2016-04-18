window.PageSketch =
  init: ->
    @opened = false
    @redo_buffer = []

    # custom sketch close link
    @getCloseLink().click (ev) =>
      @toggleSketch()
      return false

    # custom undo link
    @getUndoLink().click (ev) =>
      @redo_buffer.push(a) if a = @getSketch().actions.pop()
      @redo_buffer.shift() until @redo_buffer.length <= 20
      @getSketch().redraw()
      return false

    # custom redo link
    @getRedoLink().click (ev) =>
      @getSketch().actions.push(a) if a = @redo_buffer.pop()
      @getSketch().redraw()
      return false

    # start sketch button
    @getSketchBtn().click (ev) =>
      @toggleSketch()
      return false

    # Save button
    @getSaveBtn().click (ev) =>
      unless @getSaveBtn().hasClass("disabled")
        @getSaveBtn().toggleClass("disabled")
        @getSaveIco().toggleClass("icon-save icon-refresh icon-spin")
        $.ajax
          type: "POST"
          url: @getContainer().data("target-url")
          data: { data: @dataURL(), origin: GridMap.mergeURL(window.location.href) }
          success: (sketch_id, status, xhr) =>
            alert(sketch_id); # simplified ;)
            @getSaveIco().toggleClass("icon-refresh icon-spin icon-ok")
            delay 2500, =>
              @getSaveIco().toggleClass("icon-ok icon-save")
              @getSaveBtn().toggleClass("disabled")
          error: (xhr, status, msg) =>
            alert("failed"); # simplified ;)
            @getSaveIco().toggleClass("icon-refresh icon-spin icon-exclamation")
            @getSaveBtn().toggleClass("btn-success btn-danger")
            delay 2500, =>
              @getSaveIco().toggleClass("icon-exclamation icon-save")
              @getSaveBtn().toggleClass("disabled btn-success btn-danger")
      return false

    # dropdown highlight switches
    @getContainer().find(".color-menu a, .size-menu a").click (ev) =>
      $(ev.delegateTarget).parents(".dropdown-menu").find("a").removeClass("active")
      $(ev.delegateTarget).addClass("active")

    # marker highlight switch
    @getContainer().find("a[data-tool=marker]").click (ev) =>
      @getContainer().find("a[data-tool=marker]").addClass("active")
      @getContainer().find("a[data-tool=eraser]").removeClass("active")

    # eraser highlight switch
    @getContainer().find("a[data-tool=eraser]").click (ev) =>
      @getContainer().find("a[data-tool=eraser]").addClass("active")
      @getContainer().find("a[data-tool=marker]").removeClass("active")

    # stupid webkit render fix
    @getContainer().find("a.dropdown-toggle").click (ev) =>
      @toggleSketch()
      delay 1, => @toggleSketch()

    # load sketch
    if sid = @getContainer().data("load-sketch")
      @toggleSketch() unless @opened
      delay 250, => @load(sid)

  toggleSketch: ->
    @opened = !@opened
    @getSketch()
    @getSketchBtn().toggle()
    @getContainer().toggle()
    @getGridmap().toggleClass("sketch_active")

  # load: (id) ->
  #   $.ajax "#{@getContainer().data("target-url")}/#{id}.json",
  #     success: (data, status, xhr) =>
  #       context = @getCanvas().get(0).getContext('2d')
  #       image = new Image();
  #       image.onload = -> context.drawImage(this, 0, 0)
  #       image.src = data.data
  #     error: (xhr, status, msg) => alert("Failed to load sketch! #{xhr.status}: #{msg}")

  load: (id) ->
    $.ajax "#{@getContainer().data("target-url")}/#{id}.json",
      success: (data, status, xhr) =>
        sketch = @getSketch()
        $.each data.json_data, -> sketch.actions.push(this)
        sketch.redraw()
      error: (xhr, status, msg) =>
        alert("failed"); # simplified ;)

  # dataURL: -> @getCanvas().get(0).toDataURL()
  dataURL: -> JSON.stringify(@getSketch().actions)

  getGridmap:   -> @getCanvas().parents(".gridmap")
  getCanvas:    -> $('#pagesketch_viewport')
  getSketch:    -> @getCanvas().sketch()
  getContainer: -> $('#pagesketch_main_container')
  getSketchBtn: -> $('a.pagesketch_edit_toggle')
  getSaveBtn:   -> @getContainer().find(".save_sketch")
  getSaveIco:   -> @getSaveBtn().find("i")
  getCloseLink: -> @getContainer().find(".close_sketch")
  getUndoLink:  -> @getContainer().find("a.undo_tool")
  getRedoLink:  -> @getContainer().find("a.redo_tool")