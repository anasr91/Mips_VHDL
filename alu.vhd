----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:14 10/13/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

begin

process(a ,b ,s)

begin

if (s="0000")
    then z <= a and b;
elsif (s="0001")
    then z <= a or b;
elsif (s="0010")
    then z <= a + b;
elsif (s="0110")
    then z <= a - b;
elsif (s="0111")
    then 
	    if (a < b)
          then z <= "00000000000000000000000000000001";
       else z <= "00000000000000000000000000000000";
       end if;
	 
elsif (s="1100")
    then z <= a nor b;
end if;

if (a = b) 
    then z <= "00000000000000000000000000000001";
else z <= "00000000000000000000000000000000";

end if;

end process;

end Behavioral;

