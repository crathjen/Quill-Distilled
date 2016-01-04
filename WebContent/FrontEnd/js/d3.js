/**
 * 
 */
$(document).ready(function(){
	$("#d3btn").click(function(){
		$(".bodyContent").html("").css("background","white");
		var diameter = 1100,
	    format = d3.format(",d"),
	    color = d3.scale.category20c();

		var bubble = d3.layout.pack()
	    .sort(null)
	    .size([diameter, diameter])
	    .padding(1.5);

		var svg1 = d3.select(".bodyContent").append("svg")
	    .attr("width", diameter)
	    .attr("height", diameter)
	    .attr("class", "bubble");
		var arr = [{"name":"animals","value":8},{"name":"humor","value":119},{"name":"ignorance","value":7},{"name":"imagination","value":7},{"name":"courage","value":14},{"name":"inspirational","value":101},{"name":"human-nature","value":7},{"name":"happiness","value":26},{"name":"education","value":9},{"name":"philosophy","value":33},{"name":"religion","value":20},{"name":"success","value":7},{"name":"history","value":9},{"name":"memory","value":12},{"name":"writing","value":57},{"name":"reading","value":24},{"name":"cats","value":7},{"name":"forgiveness","value":8},{"name":"lies","value":10},{"name":"lying","value":7},{"name":"truth","value":42},{"name":"individuality","value":7},{"name":"wisdom","value":30},{"name":"books","value":37},{"name":"life","value":121},{"name":"friendship","value":15},{"name":"friends","value":9},{"name":"attributed-no-source","value":8},{"name":"death","value":42},{"name":"politics","value":14},{"name":"world","value":7},{"name":"war","value":11},{"name":"funny","value":6},{"name":"knowledge","value":9},{"name":"age","value":7},{"name":"women","value":35},{"name":"men","value":18},{"name":"future","value":6},{"name":"past","value":8},{"name":"faith","value":8},{"name":"god","value":19},{"name":"freedom","value":15},{"name":"intelligence","value":11},{"name":"stupidity","value":6},{"name":"fear","value":7},{"name":"reality","value":12},{"name":"despair","value":6},{"name":"self","value":6},{"name":"belief","value":10},{"name":"paradox","value":9},{"name":"beauty","value":10},{"name":"love","value":182},{"name":"purpose","value":6},{"name":"solitude","value":7},{"name":"hope","value":12},{"name":"passion","value":7},{"name":"humour","value":18},{"name":"perspective","value":6},{"name":"science","value":16},{"name":"h2g2","value":6},{"name":"science-fiction","value":7},{"name":"atheism","value":13},{"name":"dreams","value":21},{"name":"psychology","value":7},{"name":"music","value":9},{"name":"change","value":10},{"name":"drinking","value":7},{"name":"insanity","value":7},{"name":"language","value":7},{"name":"inspiration","value":10},{"name":"art","value":11},{"name":"humanity","value":11},{"name":"nature","value":7},{"name":"reason","value":6},{"name":"time","value":6},{"name":"loneliness","value":10},{"name":"youth","value":8},{"name":"respect","value":7},{"name":"morality","value":10},{"name":"sex","value":8},{"name":"poetry","value":15},{"name":"literature","value":6},{"name":"pain","value":14},{"name":"strength","value":7},{"name":"relationships","value":13},{"name":"grief","value":7},{"name":"gender","value":10},{"name":"peace","value":10},{"name":"loss","value":9},{"name":"identity","value":8},{"name":"hate","value":8},{"name":"chaos","value":6},{"name":"stories","value":9},{"name":"power","value":6},{"name":"romance","value":9},{"name":"shakespeare","value":12},{"name":"existence","value":6},{"name":"romeo-and-juliet","value":8},{"name":"sadness","value":6},{"name":"words","value":8},{"name":"goodness","value":6},{"name":"hatred","value":6},{"name":"empowerment","value":10},{"name":"independence","value":6},{"name":"marriage","value":8},{"name":"honesty","value":7},{"name":"life-lessons","value":6},{"name":"race","value":7},{"name":"racism","value":6},{"name":"optimism","value":8},{"name":"people","value":6},{"name":"children","value":6},{"name":"soul","value":6},{"name":"feminism","value":13},{"name":"heart","value":7},{"name":"justice","value":6},{"name":"perseverance","value":6},{"name":"memories","value":6},{"name":"anais-nin","value":6}]
		var datasource = {children: arr};
		
		var node=svg1.selectAll(".node")
			.data(bubble.nodes(datasource)
			.filter(function(d){return !d.children;}))
			.enter().append("g")
			.attr("class", "node")
			.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
		
		node.append("title")
	      .text(function(d) { return d.name + ": " + format(d.value); });

		
		node.append("circle")
	      .attr("r", function(d) { return d.r; })
	      .style("fill", function(d) { return color(d.name); });
		
		node.append("text")
	      .attr("dy", ".3em")
	      .style("text-anchor", "middle")
	      .text(function(d) { return d.name.substring(0, d.r / 4); });
		
		//$(".bodyContent").html("").css("background","white");
//		$.ajax({
//			url: "/Quotes/REST/D3DataTagForce",
//			dataType: "json",
//			success: function(data){
//				console.log(data);
				var data=[[{"id":4,"tagText":"humor"},{"id":9,"tagText":"courage"},{"id":15,"tagText":"inspirational"},{"id":22,"tagText":"happiness"},{"id":24,"tagText":"philosophy"},{"id":25,"tagText":"religion"},{"id":35,"tagText":"writing"},{"id":37,"tagText":"reading"},{"id":49,"tagText":"truth"},{"id":55,"tagText":"wisdom"},{"id":57,"tagText":"books"},{"id":58,"tagText":"life"},{"id":59,"tagText":"friendship"},{"id":66,"tagText":"death"},{"id":70,"tagText":"politics"},{"id":86,"tagText":"women"},{"id":87,"tagText":"men"},{"id":96,"tagText":"god"},{"id":101,"tagText":"freedom"},{"id":152,"tagText":"love"},{"id":180,"tagText":"humour"},{"id":185,"tagText":"science"},{"id":205,"tagText":"dreams"},{"id":375,"tagText":"poetry"},{"id":421,"tagText":"pain"}],[{"source":0,"target":4,"count":5},{"source":0,"target":5,"count":2},{"source":0,"target":14,"count":5},{"source":0,"target":6,"count":6},{"source":0,"target":15,"count":3},{"source":0,"target":16,"count":3},{"source":0,"target":11,"count":5},{"source":0,"target":21,"count":6},{"source":0,"target":19,"count":5},{"source":0,"target":13,"count":2},{"source":0,"target":17,"count":2},{"source":1,"target":19,"count":2},{"source":1,"target":2,"count":2},{"source":1,"target":11,"count":2},{"source":2,"target":13,"count":5},{"source":2,"target":19,"count":6},{"source":2,"target":11,"count":6},{"source":2,"target":22,"count":2},{"source":2,"target":4,"count":2},{"source":3,"target":19,"count":3},{"source":3,"target":11,"count":4},{"source":3,"target":4,"count":2},{"source":4,"target":5,"count":3},{"source":4,"target":11,"count":5},{"source":4,"target":9,"count":4},{"source":5,"target":21,"count":2},{"source":5,"target":17,"count":4},{"source":6,"target":7,"count":4},{"source":6,"target":18,"count":2},{"source":6,"target":10,"count":3},{"source":6,"target":8,"count":2},{"source":6,"target":15,"count":4},{"source":6,"target":23,"count":2},{"source":7,"target":10,"count":13},{"source":8,"target":9,"count":2},{"source":8,"target":13,"count":2},{"source":8,"target":19,"count":4},{"source":9,"target":11,"count":4},{"source":9,"target":19,"count":2},{"source":10,"target":11,"count":3},{"source":11,"target":12,"count":2},{"source":11,"target":13,"count":10},{"source":11,"target":20,"count":2},{"source":11,"target":17,"count":2},{"source":11,"target":19,"count":13},{"source":11,"target":22,"count":4},{"source":11,"target":24,"count":4},{"source":12,"target":19,"count":5},{"source":13,"target":24,"count":2},{"source":13,"target":19,"count":4},{"source":15,"target":16,"count":14},{"source":15,"target":19,"count":2},{"source":15,"target":23,"count":2},{"source":18,"target":19,"count":2},{"source":19,"target":23,"count":7},{"source":19,"target":24,"count":5}]]
				//Width and height
				var w = 1000;
				var h = 600;
				var force = d3.layout.force()
								.nodes(data[0])
								.links(data[1])
								.size([w, h])
								.linkDistance([140])
								.charge([-900])
								.start();
				var colors = d3.scale.category10();

				//Create SVG element
				var svg = d3.select(".bodyContent")
							.insert("svg","svg")
							.attr("width", w)
							.attr("height", h)
							.attr("class", "force");
				//Create edges as lines
				var edges = svg.selectAll("line")
					.data(data[1])
					.enter()
					.append("line")
					.style("stroke", "#ccc")
					.style("stroke-width", function(d) { return 1.4*Math.sqrt(d.count)}); 
					
				
				//Create nodes as circles
				var nodes = svg.selectAll(".node")
					.data(data[0])
					.enter()
					.append("g")
					.attr("class", "node")
					.call(force.drag)
					.on('dblclick', connectedNodes);
				
				nodes.append("circle")
					.attr("r", 10)
					.style("fill", function(d, i) {
						return colors(i);
					});
				
				nodes.append("text")
					.attr("dx", 12)
					.attr("dy", ".35em")
					.text(function(d){return d.tagText});
				
				//Every time the simulation "ticks", this will be called
				force.on("tick", function() {

					edges.attr("x1", function(d) { return d.source.x; })
						 .attr("y1", function(d) { return d.source.y; })
						 .attr("x2", function(d) { return d.target.x; })
						 .attr("y2", function(d) { return d.target.y; });
				
					nodes.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
//					nodes.attr("cx", function(d) { return d.x; })
//						 .attr("cy", function(d) { return d.y; });
		
				});
				
				//Toggle stores whether the highlighting is on
				var toggle = 0;
				//Create an array logging what is connected to what
				var linkedByIndex = {};
				for (i = 0; i < nodes[0].length; i++) {
				    linkedByIndex[i + "," + i] = 1;
				};
				console.log(nodes)
				data[1].forEach(function (d) {
					//console.log(d);
				    linkedByIndex[d.source.index + "," + d.target.index] = 1;
				});
				console.log(linkedByIndex)
				//This function looks up whether a pair are neighbours
				function neighboring(a, b) {
				    return linkedByIndex[a + "," + b];
				}
				function connectedNodes() {
				    if (toggle == 0 ) {
				        //Reduce the opacity of all but the neighbouring nodes
				        d = d3.select(this)[0][0].__data__.index;
				        console.log(d);
				        nodes.style("opacity", function (o) {
				        	console.log(o.index)
				        	console.log(neighboring(d, o.index) | neighboring(o.index, d) ? 1 : 0.1)
				            return neighboring(d, o.index) | neighboring(o.index, d) ? 1 : 0.1;
				        });
				        edges.style("opacity", function (o) {
				        	//console.log(o)
				            return d==o.source.index | d==o.target.index ? 1 : 0.1;
				        });
				        //Reduce the op
				        toggle = 1;
				    } else {
				        //Put them back to opacity=1
				        nodes.style("opacity", 1);
				        edges.style("opacity", 1);
				        toggle = 0;
				    }
				    
				}
				
				
//			}
//		})
		$("svg.force").before("<h4>Force Diagram showing connections between subject tags: thicker links indicate tags that appear together on quotes more often.  Try double-clicking nodes or dragging them!</h4>");
		$("svg.bubble").before("<h4>Bubble Chart representing how often a tag is used to describe a quotation.  Bigger circles mean a tag is used more often.</h4>");
	
	})
})
	
