namespace WebApplication.Models
{
    public class ArticleViewModel
    {
        public string Title { get; set; } = string.Empty;
        public string ImageSrc { get; set; } = string.Empty;
        public string Summary { get; set; } = string.Empty;
        public string? ContentHtml { get; set; }
    }
}
