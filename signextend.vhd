----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:02 12/25/2016 
-- Design Name: 
-- Module Name:    signextend - Behavioral 
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

entity signextend is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end signextend;

architecture Behavioral of signextend is


begin

process(x)

begin

if(x(15) = '1') 
   then z(15 downto 0) <= X ;
        z(31 downto 16) <= "1111111111111111" ;
elsif(x(15) = '0') 
   then z(15 downto 0) <= x ;
        z(31 downto 16) <= "0000000000000000" ;
end if;

end process;

end Behavioral;
