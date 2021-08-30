import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const newUserSignUp = functions.auth.user().onCreate((user) => {
	if (user.providerData?.length) {
		return admin.firestore().collection("users").doc(user.uid).set({
			email: user.email,
			uid: user.uid,
			photoUrl: user.photoURL,
			isAdmin: false,
			quizzes: [],
		});
	} else {
		return null;
	}
});

// TODO query param -> AUTHOR -ne user
export const getUserQuizzes = functions.https.onRequest(async (request, result) => {

	const db = admin.firestore()

	let res_json = []

	try {
		let snapshot: FirebaseFirestore.Query<FirebaseFirestore.DocumentData> = db.collection("quizzes");
		for (let [fieldPath, value] of Object.entries(request.query)) {
			snapshot = snapshot.where(fieldPath, "==", value);
		}
		const userQuizzes = await snapshot.get()
		for (const doc of userQuizzes.docs) {
			res_json.push(await getDocWithSubcollections(doc))
		}

		console.log(res_json)
		result.send(res_json)

	} catch (error) {
		console.error("Error", "You done fucked up son..")
		console.error(error)
		result.send("error")
	}
})




export const getDocWithSubcollections = async (doc: any) => {
	const item: any = { id: doc.id, ...doc.data() };
	const subcollections = await doc.ref.listCollections();
	for (const sub of subcollections) {
	  const arr = [];
	  const subDocs = (await sub.get()).docs;
	  for (const d of subDocs) {
		arr.push(await getDocWithSubcollections(d));
	  }
	  item[sub.id] = arr;
	}
	return item;
  };