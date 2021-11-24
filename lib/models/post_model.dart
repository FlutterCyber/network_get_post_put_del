class Post {
  int id;
  String name;
  String age;
  int salary;
  String image;

  Post(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary,
      required this.image});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        salary = json['salary'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'salary': salary,
        'image': image,
      };
}
