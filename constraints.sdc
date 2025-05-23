

create_clock [get_ports rclk_i] -name rclk_i -period 5
set_propagated_clock rclk_i
create_clock [get_ports wclk_i] -name wclk_i -period 10
set_propagated_clock wclk_i

set_clock_groups -asynchronous -group [get_clocks {rclk_i wclk_i}]

set read_period     [get_property -object_type clock [get_clocks {rclk_i}] period]
set write_period    [get_property -object_type clock [get_clocks {wclk_i}] period]
set min_period      [expr {min(${read_period}, ${write_period})}]

set_max_delay -from [get_pins rgray[*]*df*/CLK] -to [get_pins wq1_rgray[*]*df*/D] $min_period
# set_max_delay -from [get_pins {\rgray[1]*df*/CLK}] -to [get_pins {\wq1_rgray[1]*df*/D}] $min_period
# set_max_delay -from [get_pins {\rgray[2]*df*/CLK}] -to [get_pins {\wq1_rgray[2]*df*/D}] $min_period
# set_max_delay -from [get_pins {\rgray[3]*df*/CLK}] -to [get_pins {\wq1_rgray[3]*df*/D}] $min_period

set_max_delay -from [get_pins wgray[*]*df*/CLK] -to [get_pins rq1_wgray[*]*df*/D] $min_period
# set_max_delay -from [get_pins {\wgray[1]*df*/CLK}] -to [get_pins {\rq1_wgray[1]*df*/D}] $min_period
# set_max_delay -from [get_pins {\wgray[2]*df*/CLK}] -to [get_pins {\rq1_wgray[2]*df*/D}] $min_period
# set_max_delay -from [get_pins {\wgray[3]*df*/CLK}] -to [get_pins {\rq1_wgray[3]*df*/D}] $min_period


# wgray - write domain flip flops
#   sky130_fd_sc_hd__dfrtp_2 \wgray[0]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\wgraynext[0] ),
#     .Q(\wgray[0] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wgray[1]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\wgraynext[1] ),
#     .Q(\wgray[1] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wgray[2]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\wgraynext[2] ),
#     .Q(\wgray[2] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wgray[3]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\wgraynext[3] ),
#     .Q(\wgray[3] ),
#     .RESET_B(wrst_n_i)
#   );

# wgray - read domain flip flops
#   sky130_fd_sc_hd__dfrtp_2 \rq1_wgray[0]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\wgray[0] ),
#     .Q(\rq1_wgray[0] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rq1_wgray[1]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\wgray[1] ),
#     .Q(\rq1_wgray[1] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rq1_wgray[2]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\wgray[2] ),
#     .Q(\rq1_wgray[2] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rq1_wgray[3]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\wgray[3] ),
#     .Q(\rq1_wgray[3] ),
#     .RESET_B(rrst_n_i)
#   );

# rgray - read domain flip flops
#   sky130_fd_sc_hd__dfrtp_2 \rgray[0]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\rgraynext[0] ),
#     .Q(\rgray[0] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rgray[1]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\rgraynext[1] ),
#     .Q(\rgray[1] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rgray[2]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\rgraynext[2] ),
#     .Q(\rgray[2] ),
#     .RESET_B(rrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \rgray[3]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(rclk_i),
#     .D(\rgraynext[3] ),
#     .Q(\rgray[3] ),
#     .RESET_B(rrst_n_i)
#   );

# rgray - write domain flip flops
#   sky130_fd_sc_hd__dfrtp_2 \wq1_rgray[0]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\rgray[0] ),
#     .Q(\wq1_rgray[0] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wq1_rgray[1]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\rgray[1] ),
#     .Q(\wq1_rgray[1] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wq1_rgray[2]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\rgray[2] ),
#     .Q(\wq1_rgray[2] ),
#     .RESET_B(wrst_n_i)
#   );
#   sky130_fd_sc_hd__dfrtp_2 \wq1_rgray[3]_sky130_fd_sc_hd__dfrtp_2_Q  (
#     .CLK(wclk_i),
#     .D(\rgray[3] ),
#     .Q(\wq1_rgray[3] ),
#     .RESET_B(wrst_n_i)
#   );
