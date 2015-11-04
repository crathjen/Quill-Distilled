/**
 * 
 */
$(document).ready(function(){
	$("#d3btn").click(function(){
		$(".bodyContent").html("").css("background","white");
		$.ajax({
			url: "/Quotes/REST/D3Data",
			dataType: "json",
			success: function(data){
				console.log(data);
				//Width and height
				var w = 1000;
				var h = 600;
				var force = d3.layout.force()
								.nodes(data[0])
								.links(data[1])
								.size([w, h])
								.linkDistance([200])
								.charge([-1200])
								.start();
				var colors = d3.scale.category10();

				//Create SVG element
				var svg = d3.select(".bodyContent")
							.append("svg")
							.attr("width", w)
							.attr("height", h);
				//Create edges as lines
				var edges = svg.selectAll("line")
					.data(data[1])
					.enter()
					.append("line")
					.style("stroke", "#ccc")
					.style("stroke-width", 1);
				
				//Create nodes as circles
				var nodes = svg.selectAll(".node")
					.data(data[0])
					.enter()
					.append("g")
					.attr("class", "node")
					.call(force.drag);
				
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
			}
		})
	})
})
	
