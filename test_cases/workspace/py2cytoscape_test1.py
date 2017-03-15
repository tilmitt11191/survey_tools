from py2cytoscape.data.cyrest_client import CyRestClient

cy = CyRestClient()
network = cy.network.create(name='My Network', collection='My network collection')
print(network.get_id())
