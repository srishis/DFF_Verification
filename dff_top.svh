// Order matters here so include in order of compilation dependencies

`include "dff_transaction.sv"
`include "dff_if.sv"
`include "dff_configuration.sv"
`include "dff_generator.sv"
`include "dff_driver.sv"
`include "dff_monitor.sv"
`include "dff_coverage.sv"
`include "dff_env.sv"
`include "dff_testbench.sv"
`include "dff.sv"
`include "top.sv"
