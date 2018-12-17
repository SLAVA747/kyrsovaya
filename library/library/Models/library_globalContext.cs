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

        public virtual DbSet<ВыдачаКниг> ВыдачаКниг { get; set; }
        public virtual DbSet<Жанры> Жанры { get; set; }
        public virtual DbSet<Книги> Книги { get; set; }
        public virtual DbSet<СистемаШтрафов> СистемаШтрафов { get; set; }
        public virtual DbSet<Читатели> Читатели { get; set; }
        public virtual DbSet<Штрафы> Штрафы { get; set; }

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

            modelBuilder.Entity<ВыдачаКниг>(entity =>
            {
                entity.HasKey(e => e.IdВыдачи)
                    .HasName("выдача_книг_pk");

                entity.ToTable("выдача_книг");

                entity.Property(e => e.IdВыдачи)
                    .HasColumnName("id_выдачи")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdКниги).HasColumnName("id_книги");

                entity.Property(e => e.IdЧитателя).HasColumnName("id_читателя");

                entity.Property(e => e.IdШтрафа).HasColumnName("id_штрафа");

                entity.Property(e => e.ДатаВыдачи)
                    .HasColumnName("дата_выдачи")
                    .HasColumnType("date");

                entity.Property(e => e.ОжидаемаяДатаВозврата)
                    .HasColumnName("ожидаемая_дата_возврата")
                    .HasColumnType("date");

                entity.Property(e => e.СуммаШтрафов)
                    .HasColumnName("сумма_штрафов")
                    .HasColumnType("money");

                entity.Property(e => e.ФактическаяДатаВозврата)
                    .HasColumnName("фактическая_дата_возврата")
                    .HasColumnType("date");

                entity.HasOne(d => d.IdКнигиNavigation)
                    .WithMany(p => p.ВыдачаКниг)
                    .HasForeignKey(d => d.IdКниги)
                    .HasConstraintName("выдача_книг_книги_fk");

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

            modelBuilder.Entity<Книги>(entity =>
            {
                entity.HasKey(e => e.IdКниги)
                    .HasName("книги_pk");

                entity.ToTable("книги");

                entity.Property(e => e.IdКниги)
                    .HasColumnName("id_книги")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdЖанра).HasColumnName("id_жанра");

                entity.Property(e => e.НазваниеКниги).HasColumnName("Название_Книги");

                entity.HasOne(d => d.IdЖанраNavigation)
                    .WithMany(p => p.Книги)
                    .HasForeignKey(d => d.IdЖанра)
                    .HasConstraintName("книги_жанры_fk");
            });

            modelBuilder.Entity<СистемаШтрафов>(entity =>
            {
                entity.HasKey(e => e.IdСистемыШтрафов)
                    .HasName("система_штрафов_pk");

                entity.ToTable("система_штрафов");

                entity.Property(e => e.IdСистемыШтрафов)
                    .HasColumnName("id_системы_штрафов")
                    .ValueGeneratedNever();

                entity.Property(e => e.ОписаниеПовреждений).HasColumnName("описание_повреждений");

                entity.Property(e => e.ШтрафнаяСумма)
                    .HasColumnName("штрафная сумма")
                    .HasColumnType("money");
            });

            modelBuilder.Entity<Читатели>(entity =>
            {
                entity.HasKey(e => e.IdЧитателя)
                    .HasName("читатели_pk");

                entity.ToTable("читатели");

                entity.Property(e => e.IdЧитателя)
                    .HasColumnName("id_читателя")
                    .ValueGeneratedNever();

                entity.Property(e => e.Адрес).HasColumnName("адрес");

                entity.Property(e => e.Имя).HasColumnName("имя");

                entity.Property(e => e.Отчество).HasColumnName("отчество");

                entity.Property(e => e.Телефон).HasColumnName("телефон");

                entity.Property(e => e.Фамилия).HasColumnName("фамилия");
            });

            modelBuilder.Entity<Штрафы>(entity =>
            {
                entity.HasKey(e => e.IdШтрафа)
                    .HasName("штрафы_pk");

                entity.ToTable("штрафы");

                entity.Property(e => e.IdШтрафа)
                    .HasColumnName("id_штрафа")
                    .ValueGeneratedNever();

                entity.Property(e => e.IdВыдачи).HasColumnName("id_выдачи");

                entity.Property(e => e.IdСистемыШтрафов).HasColumnName("id_системы_штрафов");

                entity.HasOne(d => d.IdСистемыШтрафовNavigation)
                    .WithMany(p => p.Штрафы)
                    .HasForeignKey(d => d.IdСистемыШтрафов)
                    .HasConstraintName("штрафы_система_штрафов_fk");
            });
        }
    }
}
