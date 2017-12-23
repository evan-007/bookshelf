defmodule BookshelfWeb.Plugs.CurrentUser do
  import Plug.Conn
  alias BookshelfWeb.Guardian.Plug

  @assign_name :current_user

  def init(opts), do: opts

  def call(conn, _opts) do
    current_user = Plug.current_resource(conn)
    assign(conn, @assign_name, current_user)
  end

end
