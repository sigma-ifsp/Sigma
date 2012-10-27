module ClientsHelper
  def points_percentage(points, total)
    number_to_percentage( ( points.to_f / total.to_f) * 100 , precision: 0)
  end
end
