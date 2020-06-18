defmodule CompiledHelper do
  use Wallaby.DSL

  alias Wallaby.Browser
  alias Wallaby.Query

  @doc """
  This version has inline Queries.
  There is no dialyzer error on this version
  """
  def log_in_no_error(session) do
    session
    |> Browser.visit("/login")
    |> Browser.fill_in(Query.text_field("username"), with: "me")
    |> Browser.click(Query.css("button", text: "Log in"))
    |> Browser.assert_has(Query.css("h1", text: "Logged In!"))
  end

  @username_field Query.text_field("username")
  @log_in_button Query.css("button", text: "Log in")
  @logged_in_h1 Query.css("h1", text: "Logged In!")

  @doc """
  This version uses module attributes for it's queries
  This results in the Dialyzer error "Function log_in_has_no_return/1 has no local return."
  """
  def log_in_has_no_return(session) do
    session
    |> Browser.visit("/login")
    |> Browser.fill_in(@username_field, with: "me")
    |> Browser.click(@log_in_button)
    |> Browser.assert_has(@logged_in_h1)
  end
end
