# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\sircu\ECE385\final\sdk\test_text_1\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\sircu\ECE385\final\sdk\test_text_1\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {test_text_1}\
-hw {C:\Users\sircu\ECE385\final\mb_usb_hdmi_top.xsa}\
-out {C:/Users/sircu/ECE385/final/sdk}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {test_text_1}
platform generate -quick
platform generate
catch {platform remove test_text_1}
