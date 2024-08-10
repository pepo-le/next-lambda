output "name" {
  value       = aws_lb.main.name
  description = "ALBの名前"
}

output "dns_name" {
  value       = aws_lb.main.dns_name
  description = "ALBのDNS名"
}

output "listener_http_arn" {
  value       = aws_lb_listener.http.arn
  description = "HTTPリスナーのARN"
}

output "listener_https_arn" {
  value       = length(aws_lb_listener.https) > 0 ? aws_lb_listener.https[0].arn : ""
  description = "HTTPSリスナーのARN"
}
