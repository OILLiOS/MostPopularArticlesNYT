//
//  ArticleCell.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblPublishingDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAbstract: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    
    func loadData(article: Article){
        lblSource.text = "\(article.source ?? "")"
        lblPublishingDate.text = " \(article.publishedDate)    "
        lblTitle.text = article.title
        lblAbstract.text = article.abstract
        lblAuthor.text = "\(article.byline)"
        
        if let media = article.media.first,
            let mediaURL = getURLThumbnail(articleMedia: media) {
            imgThumbnail.loadRemoteImage(url: mediaURL)
        }else{
            imgThumbnail.image = UIImage(named: "nytLogo")
        }
    }
    
    private func getURLThumbnail(articleMedia: Media) -> URL?{
        var urlThumbnail: URL?
        let networkManager = NetworkConnectionManager.sharedInstance
        if networkManager.phoneHaveConnection(){
            articleMedia.mediaMetadata.forEach { mediaMetadata in
                switch mediaMetadata.format {
                case .mediumThreeByTwo440:
                    urlThumbnail = URL(string: mediaMetadata.url)
                    break
                default:
                    urlThumbnail = URL(string: mediaMetadata.url)
                }
            }
        }
        
        return urlThumbnail
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblSource.text = ""
        lblPublishingDate.text = ""
        lblTitle.text = ""
        lblAbstract.text = ""
        imgThumbnail.image = UIImage(named: "loadingicon")
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    static var identifier: String { return String(describing: self) }
}
