library verilog;
use verilog.vl_types.all;
entity vending_machine is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        RS1             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        RS2             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        PRODUCT         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        CHANGE          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        coin            : in     vl_logic_vector(1 downto 0);
        pr              : out    vl_logic;
        ch              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of RS1 : constant is 1;
    attribute mti_svvh_generic_type of RS2 : constant is 1;
    attribute mti_svvh_generic_type of PRODUCT : constant is 1;
    attribute mti_svvh_generic_type of CHANGE : constant is 1;
end vending_machine;
