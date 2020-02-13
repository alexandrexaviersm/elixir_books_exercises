defmodule App.Table do
	def start() do
		pid_ping = spawn(App.Ping, :start, [])
		pid_pong = spawn(App.Pong, :start, [])

		send(pid_ping, {pid_pong, :pong})
	end
end
