<!doctype html>

<meta charset="utf-8">
<title>Dagre D3 Demo: Clusters</title>

<link rel="stylesheet" href="darge.css">
<script src="https://d3js.org/d3.v4.min.js" charset="utf-8"></script>
<script src="https://dagrejs.github.io/project/dagre-d3/latest/dagre-d3.js"></script>

<style id="css">
.clusters rect {
  fill: #00ffd0;
  stroke: #999;
  stroke-width: 1.5px;
}

text {
  font-weight: 300;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serf;
  font-size: 14px;
}

.node rect {
  stroke: #999;
  fill: #fff;
  stroke-width: 1.5px;
}

.edgePath path {
  stroke: #333;
  stroke-width: 1.5px;
}
</style>

<svg id="svg-canvas" width=960 height=600></svg>

<script id="js">
// Create the input graph

var g = new dagreD3.graphlib.Graph({compound:true})
  .setGraph({rankdir:"LR"})
  .setDefaultEdgeLabel(function() { return {}; });


//// Here we're setting the nodes
{{#NODES}}
{{.}}
{{/NODES}}

//// Set the parents to define which nodes belong to which cluster
////g.setParent('top_group', 'group');
////g.setParent('bottom_group', 'group');
////g.setParent('b', 'top_group');
////g.setParent('c', 'bottom_group');
////g.setParent('d', 'bottom_group');
////g.setParent('e', 'bottom_group');
////g.setParent('f', 'bottom_group');
//
//// Set up edges, no special attributes.
{{#EDGES}}
{{.}}
{{/EDGES}}

g.nodes().forEach(function(v) {
  var node = g.node(v);
  // Round the corners of the nodes
  node.rx = node.ry = 5;
});


// Create the renderer
var render = new dagreD3.render();

// Set up an SVG group so that we can translate the final graph.
var svg = d3.select("svg"),
    svgGroup = svg.append("g");

// Run the renderer. This is what draws the final graph.
render(d3.select("svg g"), g);

// Center the graph
var xCenterOffset = (svg.attr("width") - g.graph().width) / 2;
svgGroup.attr("transform", "translate(" + xCenterOffset + ", 40)");
svg.attr("height", g.graph().height + 80);
</script>