module CardsHelper

  def options_for_exp_month
    options_for_select(
      [["01", "1"],
      ["02", "2"],
      ["03", "3"],
      ["04", "4"],
      ["05", "5"],
      ["06", "6"],
      ["07", "7"],
      ["08", "8"],
      ["09", "9"],
      ["10", "10"],
      ["11", "11"],
      ["12", "12"]]
    )
  end

  def options_for_exp_year
    options_for_select(
      [["19", "2019"],
      ["20", "2020"],
      ["21", "2021"],
      ["22", "2022"],
      ["23", "2023"],
      ["24", "2024"],
      ["25", "2025"],
      ["26", "2026"],
      ["27", "2027"],
      ["28", "2028"],
      ["29", "2029"]]
    )
  end
  
end
