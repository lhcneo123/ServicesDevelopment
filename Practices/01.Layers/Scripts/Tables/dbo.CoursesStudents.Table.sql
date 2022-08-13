USE [SchoolDB]
GO
/****** Object:  Table [dbo].[CoursesStudents]    Script Date: 8/12/2022 8:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoursesStudents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoursesStudents](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Grade] [tinyint] NOT NULL,
 CONSTRAINT [PK_CoursesStudents] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoursesStudents_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoursesStudents]'))
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoursesStudents_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoursesStudents]'))
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoursesStudents_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoursesStudents]'))
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoursesStudents_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoursesStudents]'))
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Students]
GO
