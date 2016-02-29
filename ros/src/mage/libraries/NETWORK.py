#!/usr/bin/env python

"""
ModuleName: NETWORK.py
Author : Rakshit Allamraju

"""

Network_model = {}
Network_model['MAGEF11'] = ['MAGEF12','MAGEF23','MAGEF34']
Network_model['MAGEF12'] = ['MAGEF11','MAGEF21','MAGEF22']
Network_model['MAGEF21'] = ['MAGEF12']
Network_model['MAGEF22'] = ['MAGEF12','MAGEF24']
Network_model['MAGEF23'] = ['MAGEF11','MAGEF24','MAGEF32']
Network_model['MAGEF24'] = ['MAGEF22','MAGEF23']
Network_model['MAGEF31'] = ['MAGEF32']
Network_model['MAGEF32'] = ['MAGEF23','MAGEF31']
Network_model['MAGEF33'] = ['MAGEF34']
Network_model['MAGEF34'] = ['MAGEF11','MAGEF33']

