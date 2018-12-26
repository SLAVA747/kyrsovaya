using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace library.Models
{
    public partial class library_globalContext : DbContext
    {
        public library_globalContext()
        {
        }

        public library_globalContext(DbContextOptions<library_globalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Авторы> Авторы { get; set; }
        public virtual DbSet<ВидыКонтактов> ВидыКонтактов { get; set; }
        public virtual DbSet<ВыдачаКниг> ВыдачаКниг { get; set; }
        public virtual DbSet<Жанры> Жанры { get; set; }
        public virtual DbSet<Клиенты> Клиенты { get; set; }
        public virtual DbSet<Книги> Книги { get; set; }
        public virtual DbSet<Комментарии> Комментарии { get; set; }
        public virtual DbSet<Полка> Полка { get; set; }
        public virtual DbSet<Читатели> Читатели { get; set; }
        public virtual DbSet<Штрафы> Штрафы { get; set; }

        // Unable to generate entity type for table 'public.Комментарии'. Please see the warning messages.

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseNpgsql("Host=localhost;Database=library_global;Username=postgres;Password=1234567890");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdRole)
                    .HasName("role_pk");

                entity.ToTable("role");

                entity.Property(e => e.IdRole)
                    .HasColumnName("id_role")
                    .ValueGeneratedNever();

                entity.Property(e => e.Name).HasColumnName("name");
            });

            modelBuilder.Entity<Авторы>(entity =>
            {
                entity.HasKey(e => e.IdАвтора)
                    .HasName("авторы_pk");

                entity.ToTable("авторы");

                entity.Property(e => e.IdАвтора)
                    .HasColumnName("id_автора")
                    .ValueGeneratedNever();

                entity.Property(e => e.Фио).HasColumnName("ФИО");
            });

            modelBuilder.Entity<ВидыКонтактов>(entity =>
            {
                entity.HasKey(e => e.IdВидКонтакта)
                    .HasName("виды_контактов_pk");

                entity.ToTable("виды_контактов");

                entity.Property(e => e.IdВидКонтакта)
                    .HasColumnName("id_вид_контакта")
                    .ValueGeneratedNever();
            });

            modelBuilder.Entity<ВыдачаКниг>(entity =>
            {
                entity.HasKey(e => e.IdВыдачи)
                    .HasName("выдача_книг_pk");

                entity.ToTable("выдача_книг");

                entity.Property(e => e.IdВыдачи)
                    .HasColumnName("id_выдачи")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdПолки).HasColumnName("id_полки");

                entity.Property(e => e.IdЧитателя).HasColumnName("id_читателя");

                entity.Property(e => e.IdШтрафа).HasColumnName("id_штрафа");

                entity.Property(e => e.ДатаВыдачи)
                    .HasColumnName("дата_выдачи")
                    .HasColumnType("date");

                entity.Property(e => e.ОжидаемаяДатаВозврата)
                    .HasColumnName("ожидаемая_дата_возврата")
                    .HasColumnType("date");

                entity.Property(e => e.ФактическаяДатаВозврата)
                    .HasColumnName("фактическая_дата_возврата")
                    .HasColumnType("date");

                entity.HasOne(d => d.IdПолкиNavigation)
                    .WithMany(p => p.ВыдачаКниг)
                    .HasForeignKey(d => d.IdПолки)
                    .HasConstraintName("выдача_книг_полка_fk");

                entity.HasOne(d => d.IdЧитателяNavigation)
                    .WithMany(p => p.ВыдачаКниг)
                    .HasForeignKey(d => d.IdЧитателя)
                    .HasConstraintName("выдача_книг_читатели_fk");

                entity.HasOne(d => d.IdШтрафаNavigation)
                    .WithMany(p => p.ВыдачаКниг)
                    .HasForeignKey(d => d.IdШтрафа)
                    .HasConstraintName("выдача_книг_штрафы_fk");
            });

            modelBuilder.Entity<Жанры>(entity =>
            {
                entity.HasKey(e => e.IdЖанра)
                    .HasName("жанры_pk");

                entity.ToTable("жанры");

                entity.Property(e => e.IdЖанра)
                    .HasColumnName("id_жанра")
                    .ValueGeneratedNever();

                entity.Property(e => e.НазваниеЖанра).HasColumnName("название_жанра");
            });

            modelBuilder.Entity<Клиенты>(entity =>
            {
                entity.HasKey(e => e.IdКлиента)
                    .HasName("клиенты_pk");

                entity.ToTable("клиенты");

                entity.Property(e => e.IdКлиента)
                    .HasColumnName("id_клиента")
                    .ValueGeneratedNever();

                entity.Property(e => e.Age).HasColumnName("age");

                entity.Property(e => e.Avatar).HasColumnName("avatar");

                entity.Property(e => e.BooksBack).HasColumnName("books_back");

                entity.Property(e => e.BooksReads).HasColumnName("books_reads");

                entity.Property(e => e.Comments).HasColumnName("comments");

                entity.Property(e => e.IdRole).HasColumnName("id_role");

                entity.Property(e => e.Login).HasColumnName("login");

                entity.Property(e => e.Password).HasColumnName("password");

                entity.Property(e => e.Rate).HasColumnName("rate");

                entity.Property(e => e.Адрес).HasColumnName("адрес");

                entity.Property(e => e.Имя).HasColumnName("имя");

                entity.Property(e => e.Отчество).HasColumnName("отчество");

                entity.Property(e => e.Фамилия).HasColumnName("фамилия");

                entity.HasOne(d => d.IdRoleNavigation)
                    .WithMany(p => p.Клиенты)
                    .HasForeignKey(d => d.IdRole)
                    .HasConstraintName("клиенты_role_fk");
            });

            modelBuilder.Entity<Книги>(entity =>
            {
                entity.HasKey(e => e.IdКниги)
                    .HasName("книги_pk");

                entity.ToTable("книги");

                entity.Property(e => e.IdКниги)
                    .HasColumnName("id_книги")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdАвтора).HasColumnName("id_автора");

                entity.Property(e => e.ImgSrc).HasColumnName("img_src");

                entity.Property(e => e.ДатаДобавления)
                    .HasColumnName("Дата_добавления")
                    .HasColumnType("date");

                entity.Property(e => e.НазваниеКниги).HasColumnName("Название_Книги");
            });

            modelBuilder.Entity<Комментарии>(entity =>
            {
                entity.HasKey(e => e.IdКомментария)
                    .HasName("комментарии_pk");

                entity.ToTable("комментарии");

                entity.Property(e => e.IdКомментария)
                    .HasColumnName("id_комментария")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdКлиента).HasColumnName("id_клиента");

                entity.Property(e => e.IdКниги).HasColumnName("id_книги");

                entity.Property(e => e.Text).HasColumnName("text");

                entity.HasOne(d => d.IdКлиентаNavigation)
                    .WithMany(p => p.Комментарии1)
                    .HasForeignKey(d => d.IdКлиента)
                    .HasConstraintName("комментарии_клиенты_fk");
            });

            modelBuilder.Entity<Полка>(entity =>
            {
                entity.HasKey(e => e.IdПолки)
                    .HasName("полка_pk");

                entity.ToTable("полка");

                entity.Property(e => e.IdПолки)
                    .HasColumnName("id_полки")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdАвтора).HasColumnName("id_автора");

                entity.Property(e => e.IdЖанра).HasColumnName("id_жанра");

                entity.Property(e => e.IdКниги).HasColumnName("id_книги");

                entity.HasOne(d => d.IdАвтораNavigation)
                    .WithMany(p => p.Полка)
                    .HasForeignKey(d => d.IdАвтора)
                    .HasConstraintName("полка_авторы_fk");

                entity.HasOne(d => d.IdЖанраNavigation)
                    .WithMany(p => p.Полка)
                    .HasForeignKey(d => d.IdЖанра)
                    .HasConstraintName("полка_жанры_fk");

                entity.HasOne(d => d.IdКнигиNavigation)
                    .WithMany(p => p.Полка)
                    .HasForeignKey(d => d.IdКниги)
                    .HasConstraintName("полка_книги_fk");
            });

            modelBuilder.Entity<Читатели>(entity =>
            {
                entity.HasKey(e => e.IdЧитателя)
                    .HasName("читатели_pk");

                entity.ToTable("читатели");

                entity.Property(e => e.IdЧитателя)
                    .HasColumnName("id_читателя")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdВидКонтакта).HasColumnName("id_вид_контакта");

                entity.Property(e => e.IdКлиента).HasColumnName("id_клиента");

                entity.Property(e => e.КонтактныеДанные).HasColumnName("контактные_данные");

                entity.HasOne(d => d.IdВидКонтактаNavigation)
                    .WithMany(p => p.Читатели)
                    .HasForeignKey(d => d.IdВидКонтакта)
                    .HasConstraintName("читатели_виды_контактов_fk");

                entity.HasOne(d => d.IdКлиентаNavigation)
                    .WithMany(p => p.Читатели)
                    .HasForeignKey(d => d.IdКлиента)
                    .HasConstraintName("читатели_клиенты_fk");
            });

            modelBuilder.Entity<Штрафы>(entity =>
            {
                entity.HasKey(e => e.IdШтрафа)
                    .HasName("штрафы_pk");

                entity.ToTable("штрафы");

                entity.Property(e => e.IdШтрафа)
                    .HasColumnName("id_штрафа")
                    .ValueGeneratedNever();

                entity.Property(e => e.ОписаниеШтрафа).HasColumnName("описание_штрафа");

                entity.Property(e => e.ШтрафнаяСумма)
                    .HasColumnName("штрафная_сумма")
                    .HasColumnType("money");
            });
        }
    }
}
