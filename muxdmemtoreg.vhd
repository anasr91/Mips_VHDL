----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:28:03 12/27/2016 
-- Design Name: 
-- Module Name:    muxdmemtoreg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxdmemtoreg is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end muxdmemtoreg;

architecture Behavioral of muxdmemtoreg is

begin

process(x , y , s)

begin

if (s = '0') 
    then z <= x ;

elsif (s = '1') 
    then z <= y ;

end if ;

end process ;


end Behavioral;

