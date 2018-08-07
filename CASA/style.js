vizmap = [

   {selector: "node", css: {
      "shape": "ellipse",
      "text-valign":"center",
      "text-halign":"center",
      "content": "data(id)",
      "border-color":"black","border-width":"1px",
      "width": "mapData(count, 0.0, 110.0, 30.0, 100.0)",
      "height":"mapData(count, 0.0, 120.0, 30.0, 100.0)",
      //"background-color": "mapData(pearson, -1.0, 0, green, white)",
      "background-color":"mapData(count, 0, 120, white, red)",
      "font-size":"8px"}},

    {selector:"node[nodeType='state']", css: {
        "shape": "roundrectangle",
	"background-color": "lightblue"
    }},

    {selector:"node[nodeType='county']", css: {
        "shape": "ellipse",
	"background-color": "white"
    }},

    {selector:"node[children]", css: {
	"height":"mapData(children, 17.0, 3180.0, 30.0, 80.0)",
	"width":"mapData(children, 17.0, 3180.0, 30.0, 80.0)"
    }},

    {selector:"node[REratio > 1]", css: {
	"background-color":"mapData(REratio, 1.0, 1.5, white, green)"
    }},

   {selector:"node:selected", css: {
       "text-valign":"center",
       "text-halign":"center",
       "border-color": "black",
       "content": "data(id)",
       "border-width": "3px",
       "overlay-opacity": 0.5,
       "overlay-color": "purple"
       }},

   {selector: 'edge', css: {
      "line-color": "rgb(200, 200, 200)",
      "target-arrow-shape": "triangle",
      "target-arrow-color": "rgb(0, 0, 0)",
      "width": "mapData(count, 1, 20, 1, 20)",
      'curve-style': 'bezier'
      }},


   ];
