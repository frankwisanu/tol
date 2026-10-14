*** Settings ***
Documentation   Master Import Hub for True Online (TOL) Automation Testing Standard
Library         SeleniumLibrary
Library         String
Library         Collections
Library         OperatingSystem

# Core Common Engine (Use minimal code across all modules)
Resource        ${CURDIR}/../common/common.resource

# Sub-Imports
Resource        ${CURDIR}/import_pages.resource
Resource        ${CURDIR}/import_features.resource
Resource        ${CURDIR}/import_locators.resource
Resource        ${CURDIR}/import_common_components.resource

# Dynamic Configurations
Variables       ${CURDIR}/../settings/${env}/settings.yaml
Variables       ${CURDIR}/../testdata/${env}/testdata.yaml

*** Variables ***
${env}          sit
${GLOBAL_TIMEOUT}    15s
