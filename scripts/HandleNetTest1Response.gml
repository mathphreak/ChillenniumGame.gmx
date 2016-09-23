if ds_map_find_value(async_load, "id") == get
   {
   if ds_map_find_value(async_load, "status") == 0
      {
      r_str = ds_map_find_value(async_load, "result");
      }
   else
      {
      r_str = "null";
      }
   }
