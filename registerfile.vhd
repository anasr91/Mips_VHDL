----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:02:14 11/24/2016 
-- Design Name: 
-- Module Name:    registerfile - Behavioral 
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

entity registerfile is
    Port ( rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           data : in  STD_LOGIC_VECTOR (31 downto 0);
           regwrite : in  STD_LOGIC;
           readdata1 : out  STD_LOGIC_VECTOR (31 downto 0);
           readdata2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerfile;

architecture Behavioral of registerfile is

type A is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal reg : A := (X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
                   X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
						 X"0000000A" ,X"00000006" ,X"00000006" ,X"00000000",
						 X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
						 X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
						 X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
						 X"00000000" ,X"00000000" ,X"00000000" ,X"00000000",
						 X"00000000" ,X"00000000" ,X"00000000" ,X"00000000");

begin

process (rs, rt, rd, data, regwrite, reg)

begin

readdata1 <= reg(conv_integer(rs));
readdata2 <= reg(conv_integer(rt));

if (regwrite = '1')
    then reg(conv_integer(rd)) <= data; 
end if;	 

end process;
end Behavioral;

