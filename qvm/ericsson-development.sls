# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

##
# qvm.ericsson-development
# ============
#
# Installs 'ericsson-development' AppVM.
#
# Pillar data will also be merged if available within the ``qvm`` pillar key:
#   ``qvm:ericsson-development``
#
# located in ``/srv/pillar/dom0/qvm/init.sls``
#
# Execute:
#   qubesctl state.sls qvm.ericsson-development dom0
##

include:
  - qvm.sys-firewall

{%- from "qvm/template.jinja" import load -%}

{% load_yaml as defaults -%}
name:         ericsson-development
present:
  - label:    orange
  - template:  ubuntu-2204
prefs:
  - netvm:    sys-firewall
require:
  - qvm:      sys-firewall
{%- endload %}

{{ load(defaults) }}
