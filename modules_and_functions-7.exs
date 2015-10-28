IO.puts "Pi at 2 digits: #{:erlang.float_to_list(3.14159, decimals: 2)}"

IO.puts "SHELL environment variable: #{System.get_env("SHELL")}"

IO.puts "Extension of script.exs: #{Path.extname("/path/script.exs")}"

{:ok, dir} = File.cwd()
IO.puts "Current working directory: #{dir}"

{username, _} = System.cmd("whoami", [])
IO.puts "Who am I? #{username}"
