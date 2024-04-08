---@diagnostic disable: lowercase-global

function rectangle_bounds_from_xywh(rectangle_xywh)
  return {
    rectangle_xywh[1],
    rectangle_xywh[2],
    rectangle_xywh[1] + rectangle_xywh[3],
    rectangle_xywh[2] + rectangle_xywh[4] }
end

function point_inside_rectangle_xywh(point, rectangle_xywh)
  local bounds = rectangle_bounds_from_xywh(rectangle_xywh)
  return
      point[1] >= bounds[1] and
      point[1] <= bounds[3] and
      point[2] >= bounds[2] and
      point[2] <= bounds[4]
end

function rectangle_bounds_intersect_boolean(bounds1, bounds2)
  local intersect_boolean =
      bounds1[1] < bounds2[3] and
      bounds1[3] > bounds2[1] and
      bounds1[2] < bounds2[4] and
      bounds1[4] > bounds2[2]
  return intersect_boolean
end

function rectangle_xywh_intersect_boolean(rectangle1, rectangle2)
  local bounds1 = rectangle_bounds_from_xywh(rectangle1)
  local bounds2 = rectangle_bounds_from_xywh(rectangle2)

  local intersect_boolean = rectangle_bounds_intersect_boolean(bounds1, bounds2)
  return intersect_boolean
end
