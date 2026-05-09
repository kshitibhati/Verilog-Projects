library verilog;
use verilog.vl_types.all;
entity ram_tb is
    generic(
        CYCLE           : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CYCLE : constant is 1;
end ram_tb;
