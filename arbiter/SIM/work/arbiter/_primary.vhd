library verilog;
use verilog.vl_types.all;
entity arbiter is
    generic(
        idle            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        grnt0           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        grnt1           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        grnt2           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rq0             : in     vl_logic;
        rq1             : in     vl_logic;
        rq2             : in     vl_logic;
        gt1             : out    vl_logic;
        gt2             : out    vl_logic;
        gt0             : out    vl_logic;
        timeout         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of grnt0 : constant is 1;
    attribute mti_svvh_generic_type of grnt1 : constant is 1;
    attribute mti_svvh_generic_type of grnt2 : constant is 1;
end arbiter;
