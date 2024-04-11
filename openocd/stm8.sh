set -x #echo on
echo openocd -f /usr/local/share/openocd/scripts/interface/stlink-dap.cfg -f target/stm8s103.cfg -c \'reset_config srst_nogate connect_assert_srst\' -c init -c halt -c resume
