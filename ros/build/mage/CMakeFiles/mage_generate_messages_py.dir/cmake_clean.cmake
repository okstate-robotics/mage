FILE(REMOVE_RECURSE
  "CMakeFiles/mage_generate_messages_py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/msg/_sensor_data.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/msg/_command_data.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/srv/_navigation_data.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/srv/_environmental_data.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/srv/_model_data.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/msg/__init__.py"
  "/home/daslab-server1/Rakshit/ros/devel/lib/python2.7/dist-packages/mage/srv/__init__.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/mage_generate_messages_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
