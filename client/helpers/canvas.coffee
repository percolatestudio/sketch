class SketchCanvas
  init: (@element) ->
    @canvas = document.createElement 'canvas'
    @canvas.height = 400
    @canvas.width = 800
    @element.appendChild(@canvas)
  
    @ctx = @canvas.getContext("2d")
  
    # set some preferences for our line drawing.
    @ctx.fillStyle = "solid"
    @ctx.lineWidth = 5
    @ctx.lineCap = "round"
    
    @canvas
  
  drawPath: (path, color) ->
    @ctx.strokeStyle = color
    
    points = path.attributes.points.slice(0)
    
    start = points.unshift()
    @ctx.beginPath()
    @ctx.moveTo(start.x, start.y)
    
    for point in points
      @ctx.lineTo(point.x,point.y)
      @ctx.stroke()
    
    @ctx.closePath()
    