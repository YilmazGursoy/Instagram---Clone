//
//  RequestListHelperMethods.h
//  Instagram - Clone
//
//  Created by Yilmaz  on 03/01/16.
//  Copyright © 2016 Yilmaz . All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Parse/Parse.h>
@protocol RequestListHelperMethodDelegate<NSObject>

@required
/**
 *  Metot RequestListHelper classının içerisinde olan iki tane unsynchrosous metodu tek tek bekler ve en son veriler parse backendine yazıldıktan sonra çağırılır yani kod burada durur
 */
-(void)getAllUserListsFromParseBackend:(NSMutableArray*)allUsers control:(BOOL)boolean;

/**
 *  RequestListHelper classı içerisinde oluşturulur ve genel amacı eger request listesi boş ise programın patlamasını engeller ve failed metotları buradan hareket eder
 */
@optional
-(void)getAllUserListsFromParseBackendFailed;

@end





@interface RequestListHelperMethods : NSObject<RequestListHelperMethodDelegate>

@property (strong, nonatomic) id<RequestListHelperMethodDelegate> delegate;


/**
 *  Tum gonderilen waitingRequest listelerinin güncellenmesi için ve request listelerinin güncellenmesi için direk olarak waiting request key inden almak yerine buradan alınmalıdır
 *
 *  @return Yeni waiting request arrayi
 */
-(void)getSendingRequestUserListWithControl:(BOOL)boolean;


/**
 *  Tum degisikliklerin parse backendinde yazılmasını saglar
 *
 *  @param currentList Parse backendine yazılacak yeni liste
 */
-(void)setAllChangesParseBackend:(NSMutableArray*)currentList withControl:(BOOL)boolean;


/**
 *  Method Singleton patterndır ve gorevi bu objejin çağırdıgı tüm fonksiyonları sanki class fonksiyonuymuş gibi çağırmaktır
 *
 *  @return  statik RequestListHelperMethods objesi dondurmektedir
 */
-(instancetype)initWithDelegate:(id)delegate;

/**
 *  Her defasında yeniden userList set get edilme işlemleri ile ugrasmak yerine direk statik variable çekilmektedir statik array ise set metodundan hemen sonra set edilmektedir
 *
 *  @return statik array user list
 */
-(NSMutableArray*) getStaticUserList;

/**
 *  Istenilen user' in request classından silinmesini yarayan metotdur
 *
 *  @param deletingUser silinmek istenen user
 */
+(void)removeUserFromRequestLists:(PFUser*)deletingUser;

@end
