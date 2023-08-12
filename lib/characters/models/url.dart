class Url {
	String? type;
	String? url;

	Url({this.type, this.url});

	factory Url.fromJson(Map<String, dynamic> json) => Url(
				type: json['type'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'url': url,
			};
}
