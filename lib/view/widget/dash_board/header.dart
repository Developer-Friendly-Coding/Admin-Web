import 'package:clean_arch/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context)) //1100보다작으면 아이콘보임
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        if (!Responsive.isMobile(context)) //모바일 보다 크면 dasboard텍스트보임
          Text(
            "지점별 센서",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context)) //모바일보다 크면 여백주는데
          Spacer(
              flex: Responsive.isDesktop(context)
                  ? 2
                  : 1), // 1100보다크면 2로 주고, 그사이, 즉 테블릿이면 1로 줌
        Expanded(flex: 1, child: SearchField()),
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18 / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18 / 2),
              child: Text("토니"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(0.75 * 18),
            margin: EdgeInsets.symmetric(horizontal: 18 / 2), //수평선으로 마진줌
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
