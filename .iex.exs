Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [enabled: true],
  width: 80,
  default_prompt:
    [
      "\e[G",
      :magenta,
      "%prefix",
      "[ ",
      :white,
      "%counter",
      :magenta,
      " ]",
      ">",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)
