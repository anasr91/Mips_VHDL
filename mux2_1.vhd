----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:23 10/04/2016 
-- Design Name: 
-- Module Name:    mux2_1 - Behavioral 
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

entity mux2_1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux2_1;

architecture Behavioral of mux2_1 is

begin

Process(x,y,s)

Begin


  
z <= ((not s) and x) or (s and y);
end Process;


end Behavioral;

