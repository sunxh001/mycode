package dao.dataconnect;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConnectionMysql {
	public static final SqlSessionFactory build() throws IOException {
		InputStream resources = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(resources);
		return ssf;
	}
}
