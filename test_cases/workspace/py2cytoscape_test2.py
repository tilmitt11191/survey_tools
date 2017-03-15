
from py2cytoscape.data.cyrest_client import CyRestClient

cy = CyRestClient(ip='127.0.0.1', port=1234)

#style_for_widget = cy.style.get_all()
#print(style_for_widget)

style = cy.style.get('metro','cytoscapejs')
print(style)