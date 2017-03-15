from py2cytoscape.data.cyrest_client import CyRestClient

cy = CyRestClient(ip='127.0.0.1', port=1234)

# 現在のセッションのクリア
cy.session.delete()

import networkx as nx
g = nx.scale_free_graph(500)

deg = nx.degree(g)
btw = nx.betweenness_centrality(g)

nx.set_node_attributes(g, 'degree', deg)
nx.set_node_attributes(g, 'betweenness', btw)

g_cy = cy.network.create_from_networkx(g)

cy.layout.apply(name='kamada-kawai', network=g_cy)

directed = cy.style.create('Directed')
cy.style.apply(directed, network=g_cy)


result = cy.edgebundling.apply(g_cy)


import py2cytoscape.cytoscapejs as renderer

view = g_cy.get_first_view()
# style_for_widget = cy.style.get(my_yeast_style.get_name(), data_format='cytoscapejs')
renderer.render(view, 'Directed', background='radial-gradient(#FFFFFF 15%, #DDDDDD 105%)')